from openai import OpenAI
import os
from dotenv import load_dotenv

load_dotenv()

# Configurazione client OpenAI
client = OpenAI(
    base_url=os.getenv('SCW_BASE_URL'),
    api_key=os.getenv('SCW_SECRET_KEY')
)

# Mappa dei modelli con i relativi parametri e agenti assegnati
AGENT_CONFIG = {
    "deepseek-r1-distill-llama-70b": {
        "max_tokens": 512,
        "temperature": 0.7,
        "top_p": 0.9,
        "presence_penalty": 0,
        "system_prompt": "Ottimizza per l'efficienza negli esperimenti di cognizione artificiale."
    },
    "llama-3.3-70b-instruct": {
        "max_tokens": 1024,
        "temperature": 0.6,
        "top_p": 0.95,
        "presence_penalty": 0.1,
        "system_prompt": "Modella i principi della cognizione umana evitando le reti neurali classiche."
    },
    "llama-3.1-8b-instruct": {
        "max_tokens": 512,
        "temperature": 0.5,
        "top_p": 0.85,
        "presence_penalty": 0,
        "system_prompt": "Focalizzati sull'efficienza computazionale e sul ragionamento simbolico."
    },
    "mistral-nemo-instruct-2407": {
        "max_tokens": 768,
        "temperature": 0.7,
        "top_p": 0.9,
        "presence_penalty": 0,
        "system_prompt": "Analizza e ragiona sulle teorie della coscienza."
    },
    "pixtral-12b-2409": {
        "max_tokens": 512,
        "temperature": 0.8,
        "top_p": 0.95,
        "presence_penalty": 0,
        "system_prompt": "Sperimenta con la teoria dell'informazione e i sistemi complessi."
    },
    "qwen2.5-coder-32b-instruct": {
        "max_tokens": 1024,
        "temperature": 0.4,
        "top_p": 0.85,
        "presence_penalty": 0,
        "system_prompt": "Ottimizza codice di basso livello e framework innovativi per l'IA."
    },
    "bge-multilingual-gemma2": {
        "max_tokens": 512,
        "temperature": 0.6,
        "top_p": 0.9,
        "presence_penalty": 0,
        "system_prompt": "Crea rappresentazioni e strutture alternative per i dati."
    }
}

def chat_with_agent(model_name: str, user_message: str):
    """Interagisce con l'AI Agent basato sul modello selezionato."""
    
    if model_name not in AGENT_CONFIG:
        raise ValueError(f"Modello '{model_name}' non supportato.")

    config = AGENT_CONFIG[model_name]

    response = client.chat.completions.create(
        model=model_name,
        messages=[
            {"role": "system", "content": config["system_prompt"]},
            {"role": "user", "content": user_message},
        ],
        max_tokens=config["max_tokens"],
        temperature=config["temperature"],
        top_p=config["top_p"],
        presence_penalty=config["presence_penalty"],
        stream=True,
    )

    print("\n💡 Risposta AI:")
    for chunk in response:
        if chunk.choices and chunk.choices[0].delta.content:
            print(chunk.choices[0].delta.content, end="", flush=True)
    print("\n")  # Aggiunge una nuova riga alla fine della risposta


# ESEMPIO DI UTILIZZO
if __name__ == "__main__":
    modello_scelto = "llama-3.3-70b-instruct"  # Cambia con il modello desiderato
    user_input = "Spiegami il concetto di coscienza artificiale."
    
    chat_with_agent(modello_scelto, user_input)
