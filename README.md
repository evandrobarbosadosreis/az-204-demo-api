# AZ-204: Aplicação de estudo de Docker + Azure

Aplicação .net de exemplo com um Dockerfile para realizar alguns testes na publicação de containers, CD/CD e Deployment Slots no Azure.

# Deploy da imagem no Azure Container Registries

1. Login na sua conta Azure:

   `az login`

2. Crie um Resource Group:

   `az group create -n MyGroup -l eastus2`

3. Crie uma conta no Azure Container Registry:

   `az acr create -n MyAwesomeRegistry -g MyGroup --sku Standard -l eastus2`

4. Faça login no seu ACR:

   `sudo az acr login --name MyAwesomeRegistry`

5. Se a imagem da aplicação ainda não foi criada:
 
   `docker build . -t myapp:1.0 .`

6. Defina a tag da imagem que você deseja registrar no formato esperado pelo ACR:

   `docker tag myapp:1.0 myawesomeregistry.azurecr.io/optionalrepo/myapp:1.0`

7. Push da imagem para o seu ACR

   `docker push myawesomeregistry.azurecr.io/optionalrepo/myapp:1.0`

# Deploy do código

Para fazer o deploy do código diretamente em um Web App, execute:

   `az webapp up -n MyUniqueAppName -g MyGroup`