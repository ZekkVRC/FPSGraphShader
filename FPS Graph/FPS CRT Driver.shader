Shader "Zekk/FPSGraph/FPS CRT Driver"
{
    // Made by Zekk#5814.
    Properties
    {
        _Tex("CRT (Don't Touch)", 2D) = "white" {}
        [HDR]_Background("Background Color", color) = (0,0,0,1)
        
        [ToggleOff] _DivLayer("Divider Layer", float) = 0
        _Dividers("Divider Spacing (Pixels between dividers)", float) = 10
        _DividerW("Divider Width", float) = 1
        [HDR]_DivColor("Divider color", color) = (0,0,1.5,1)

        [HDR]_GoodColor("Good FPS color", color) = (0,2,0,1)
        _GoodThresh("Good FPS threshold", float) = 60
        [HDR]_MidColor("Mid FPS color", color) = (2,2,0,1)
        _BadThresh("Bad FPS threshold", float) = 30
        [HDR]_BadColor("Mid FPS color", color) = (2,0,0,1)

        _FPS("Debug FPS (-1 gives normal fps readout)", int) = -1
     }

     SubShader
     {
        Lighting Off
        cull off

        Pass
        {
            CGPROGRAM
            #include "UnityCustomRenderTexture.cginc"
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
            #pragma target 3.0

            sampler2D   _Tex;
            float4 _Background;
            float _FPS;
            float4 _GoodColor;
            float4 _MidColor;
            float4 _BadColor;
            float _GoodThresh;
            float _BadThresh;
            float _Dividers;
            float4 _DivColor;
            float _DivLayer;
            float _DividerW;

            float4 frag(v2f_customrendertexture IN) : COLOR
            {
                    fixed4 col = _Background;
                    if ((abs(1-IN.localTexcoord.y) * _CustomRenderTextureHeight) % (_CustomRenderTextureHeight/((100/_Dividers)*_CustomRenderTextureHeight/100)) < _DividerW){
                        col = _DivColor;
                        if(_DivLayer == 0){
                            return col;
                        }
                    }       
                    float shift = 1/_CustomRenderTextureWidth;
                    if(IN.localTexcoord.x > shift){
                        float2 ShiftedUVs = float2(IN.localTexcoord.x-shift, IN.localTexcoord.y);  //Shift the rendertexture by one pixel to the left
                        col = tex2D(_Tex, ShiftedUVs.xy);
                        return col;
                    }
                    else {
                        float fps = unity_DeltaTime.w;   //get fps
                        if (_FPS != -1){
                            fps = _FPS;
                        }
                        float scaledFPS = fps/_CustomRenderTextureHeight;
                        if(IN.localTexcoord.y > 1-scaledFPS){
                            if (fps > _GoodThresh){
                                return _GoodColor; //Good FPS
                            } else {
                                if (fps > _BadThresh){
                                    return _MidColor; //Mid FPS
                                }
                                else {
                                    return _BadColor; //Bad FPS
                                }
                            }
                        }
                        else {
                            return col;
                        }
                    }
            }
            ENDCG
        }
    }
}
