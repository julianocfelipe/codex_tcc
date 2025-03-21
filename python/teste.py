import requests

class ApiService:
    def __init__(self, base_url):
        self.base_url = base_url

    def get_data(self, endpoint):
        response = requests.get(f"{self.base_url}/{endpoint}")
        if response.status_code == 200:
            return response.json()
        return None

class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def display_info(self):
        return f"User: {self.name}, Email: {self.email}"

if __name__ == "__main__":
    api_service = ApiService("https://api.example.com")
    data = api_service.get_data("users")
    
    
    user = User("Rafael Castro", "rafael@example.com")
    print(user.display_info())
