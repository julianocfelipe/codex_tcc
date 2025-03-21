import ast
import sys
import json
import requests



def consultGemini(code):
    baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key='
    key = 'AIzaSyDizcXSSfZTddqkSBwfRmKDIb_cv9ktTzM'
    body = {
        "contents": [{
        "parts":[{"text": f"gere um pequeno texto sobre essa função, esse pequeno texto será para a documentação  : {code}"}]
    }]
   }
    response = requests.post(baseUrl + key, json=body)
    
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Erro: {response.status_code} - {response.reason}")
        print(f"Detalhes: {response.text}")
        print(f"Tempo de resposta: {response.elapsed.total_seconds()} segundos")
        return None    


def analyze_code(source_code):
    tree = ast.parse(source_code)
    analysis = {
        "dependencies": [],
        "class": [],
        "function": []
    }

    for node in ast.walk(tree):
        if isinstance(node, ast.Import):
            for alias in node.names:
                analysis["dependencies"].append({"name": alias.name, "alias": alias.asname})
        elif isinstance(node, ast.ImportFrom):
            module = node.module if node.module else ""
            for alias in node.names:
                analysis["dependencies"].append({"module": module, "name": alias.name, "alias": alias.asname})
        elif isinstance(node, ast.ClassDef):
            class_body = ast.unparse(node) if hasattr(ast, "unparse") else "Não suportado nesta versão do Python"
            gemeniObservation = consultGemini(class_body)
            observation = gemeniObservation['candidates'][0]['content']['parts'][0]['text']
            class_info = {
                "name": node.name,
                "methods": [n.name for n in node.body if isinstance(n, ast.FunctionDef)],
                "body": class_body,
                "obs": observation
            }
            analysis["class"].append(class_info)
        elif isinstance(node, ast.FunctionDef):
            function_body = ast.unparse(node) if hasattr(ast, "unparse") else "Não suportado nesta versão do Python"
            gemeniObservation = consultGemini(function_body)
            observation = gemeniObservation['candidates'][0]['content']['parts'][0]['text']
            function_info = {
                "name": node.name,
                "args": [arg.arg for arg in node.args.args],
                "body": function_body,
                "obs": observation
            }
            analysis["function"].append(function_info)
#        elif isinstance(node, ast.Expr) and isinstance(node.value, ast.Constant) and isinstance(node.value.value, str):
#            analysis["obs"].append({"comment": node.value.value})

    return analysis

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python analyzer.py <caminho_do_codigo.py>")
        sys.exit(1)

    file_path = sys.argv[1]

    try:
        with open(file_path, "r", encoding="utf-8") as f:
            source_code = f.read()
        result = analyze_code(source_code)
        print(json.dumps(result, indent=4, ensure_ascii=False))  
    except Exception as e:
        print(f"Erro ao analisar o código: {e}")