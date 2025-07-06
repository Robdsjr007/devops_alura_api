
# Etapa 1: Escolher a imagem base
# Usamos uma imagem oficial do Python. A tag 'slim' é uma boa opção, pois é menor que a padrão,
# mas ainda inclui as ferramentas necessárias para instalar a maioria dos pacotes Python.
# O README menciona Python 3.10+, então 3.11 é uma escolha segura e estável.
FROM python:3.11-slim

# Etapa 2: Definir o diretório de trabalho
# Todos os comandos subsequentes serão executados a partir deste diretório.
WORKDIR /app

# Etapa 3: Copiar e instalar as dependências
# Copiamos o requirements.txt primeiro para aproveitar o cache de camadas do Docker.
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 4: Copiar o código da aplicação
COPY . .

# Etapa 5: Expor a porta
EXPOSE 8000

# Etapa 6: Definir o comando de inicialização para produção
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
