def process_data(payload: dict) -> dict:
    """
    Basic data processing logic. 
    Filters invalid values and enriches data.
    """
    if "temperature" not in payload or "co2" not in payload:
        raise ValueError("Missing required fields in payload")

    # Add processing logic (e.g., validate ranges)
    if not (0 <= payload["temperature"] <= 50):
        raise ValueError("Temperature out of range")
    if not (300 <= payload["co2"] <= 5000):
        raise ValueError("CO₂ levels out of range")

    # Add additional metadata (e.g., processing timestamp)
    payload["processed"] = True
    return payload
