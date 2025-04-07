const axios = require('axios');

const baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key='
const key = 'AIzaSyDizcXSSfZTddqkSBwfRmKDIb_cv9ktTzM'

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

async function generateMd(context) {
  const prompt = `Gere o conteúdo de um arquivo html para a documentação técnica de um projeto.
As informações estão contidas no seguinte JSON: ${context}. Esse JSON representa a estrutura de um código-fonte em [especificar linguagem, ex: Python], contendo classes, funções e descrições.

O conteúdo do html deve incluir:

Um sumário com links para cada seção (ex: "Classes", "Funções fora das classes", "Outros conteúdos").

Para cada classe:

Exiba o código-fonte da classe com formatação Markdown adequada (bloco de código).

Crie uma tabela contendo as funções que pertencem à classe. A tabela deve incluir: nome da função, parâmetros e breve descrição.

Para funções que não estão em nenhuma classe:

Mostre o código-fonte de cada função.

Inclua uma descrição explicando seu propósito.

Se o JSON não contiver classes ou funções, apenas exiba o conteúdo disponível e uma descrição técnica resumida.

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

module.exports = { analysisFileContent, generateMd };