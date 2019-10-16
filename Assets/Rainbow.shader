Shader "Cg shader for RGB cube"{
    SubShader{
        Pass{
            CGPROGRAM

            #pragma vertex vert // alias for the vertex Shader
            #pragma fragment frag // alias for the fragment Shader

            // Output structure for vertex parameters

            struct v2f{
                float4 pos : SV_POSITION;
                float4 col : TEXCOORD0;
            };

            v2f vert(float4 vertexPos : POSITION){

                v2f output;
                
                output.col = vertexPos + float4(2.0, 2.0, 2.0, 1.0); 
                output.pos = UnityObjectToClipPos(vertexPos);

                return output;
            }


            float4 frag(v2f input) : COLOR // fragment Shader
            {
                // return float4(input.col.x*_SinTime.w,inout.col.y*_SinTime.y,1.0,1.0);
                //return input.col; // all colors, to go in one specific direction (colorscheme): return float4(input.col.x, 1.0,0.0,1.0);
                return float4(0.2,input.col.y*_CosTime.w*1.1-2.0   ,input.col.z*_CosTime.w*1.4+2.0,1.0);
                
            }

            ENDCG
        }
    }
}

