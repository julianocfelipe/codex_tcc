import axios from 'axios';
import { writeFileSync } from 'fs';
import dotenv from 'dotenv';
dotenv.config();


const baseUrl = process.env.GEMINI_API_URL
const key = process.env.GEMINI_API_KEY;

async function generatMkWithJson(prompt, json, temperature = 0.5) {
  try {
    console.log('tentando gerar arquivo mk...');

    const response = await axios.post(baseUrl + key, {
      contents: [{
        parts: [{ text: `${prompt}\n\n${json}` }]
      }],
      generationConfig: {
        temperature: temperature
      }
    });

    const conteudoMK = response.data.candidates[0].content.parts[0].text;
    console.log('Arquivo gerado com sucesso!');
    return conteudoMK.replace('```markdown', '').slice(0, -3);
  } catch (error) {
    console.error('---------------------------------------------');
    console.error(error);
    return null;
  }
}

async function analysisFileContent(content) {
  const prompt = 'Preencha o seguinte JSON com as seguintes informações: \n\n{ "dependencies": [], "class": [ "body" : , metodos: [ "body" ] ], "function": [] }. do seguinte codigo: \n\n somente preencha o JSON, não escreva mais nada. \n\n';

  try {
    const response = await axios.post(baseUrl + key, {
      "contents": [{
        "parts": [{ "text": prompt+content }]        
      }],
    });

    return response.data.candidates[0].content.parts[0].text; 
  } catch (error) {
    console.error('Error:', error.message);
    return null; 
  }
}


async function sendGemini(Prompt) {
  try {
    const response = await axios.post(baseUrl + key, {
      "contents": [{
        "parts": [{ "text": Prompt }]        
      }],
    });

    return response.data.candidates[0].content.parts[0].text; 
  } catch (error) {
    console.error('Error:', error.message);
    return null; 
  }  

}

async function generateMd(context) {
  const prompt = `Gere o conteúdo de um arquivo Markdown para a documentação técnica de um projeto.
As informações estão contidas no seguinte JSON: ${context}. Esse JSON representa a estrutura de um código-fonte em [especificar linguagem, ex: Python], contendo classes, funções e descrições.

O conteúdo do Markdown deve incluir:

Um sumário com links para cada seção, o sumário deve ser gerado automaticamente com base no nomes dos arquivos e com subnivel com as estruturas dentro dos arquivos.
Não adicone comentários no código-fonte, apenas o código-fonte.
Para cada classe: Exiba o código-fonte da classe com formatação Markdown adequada (bloco de código).
Crie uma tabela contendo as funções que pertencem à classe. A tabela deve incluir: nome da função, parâmetros e breve descrição.

Para funções que não estão em nenhuma classe: Mostre o código-fonte de cada função e Inclua uma descrição explicando seu propósito.

Se o JSON não contiver classes ou funções, apenas exiba uma descrição técnica resumida.
Os códigos-fonte devem ser formatados como blocos de código Markdown e devem estar indentados corretamente.
O estilo da documentação deve ser claro, técnico e bem estruturado, com uso correto de títulos e formatações Markdown.`;

  console.log(prompt)
  try {
    const response = await axios.post(baseUrl + key, {
      "contents": [{
        "parts": [{ "text": prompt }]        
      }],
    });

    return response.data.candidates[0].content.parts[0].text; 
  } catch (error) {
    console.error('Error:', error.message);
    return null; 
  }

}

export default { analysisFileContent, generateMd, generatMkWithJson, sendGemini};