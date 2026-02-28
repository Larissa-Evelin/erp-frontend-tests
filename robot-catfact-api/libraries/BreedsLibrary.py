def validate_breed_contract(breed_list):
    """
    Valida se todos os objetos na lista 'data' contêm os campos obrigatórios.
    """
    required_fields = ["breed", "country", "origin", "coat", "pattern"]
    
    if not isinstance(breed_list, list):
        raise AssertionError(f"Esperado uma lista, mas recebeu: {type(breed_list)}")

    for index, item in enumerate(breed_list):
        for field in required_fields:
            if field not in item:
                raise AssertionError(f"Erro no item {index}: Campo obrigatório '{field}' ausente.")
    
    print("Contrato validado com sucesso para todos os itens!")