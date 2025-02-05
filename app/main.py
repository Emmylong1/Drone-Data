from fastapi import FastAPI, HTTPException
from typing import List, Dict
from app.processor import process_data

app = FastAPI()

# Simulated in-memory database
data_store = []

@app.post("/data/")
async def ingest_data(payload: Dict):
    """
    Endpoint to receive drone data.
    Example payload: {"temperature": 25.5, "co2": 400, "timestamp": "2025-01-28T12:00:00Z"}
    """
    try:
        processed_data = process_data(payload)
        data_store.append(processed_data)
        return {"message": "Data ingested successfully", "data": processed_data}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.get("/data/")
async def get_data():
    """
    Endpoint to fetch all stored data.
    """
    if not data_store:
        return {"message": "No data available yet"}
    return {"data": data_store}
