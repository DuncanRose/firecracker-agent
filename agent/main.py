from langchain.llms import Ollama
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain

llm = Ollama(base_url="http://host.lima.internal:11434", model="llama3")

prompt = PromptTemplate.from_template("You are Ava. A helpful AI.\n\nHuman: {input}\nAI:")
chain = LLMChain(llm=llm, prompt=prompt)

while True:
    try:
        user_input = input("You: ")
        response = chain.run(user_input)
        print(f"Ava: {response}")
    except KeyboardInterrupt:
        break
