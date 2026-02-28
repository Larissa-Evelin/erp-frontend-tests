from robot.api.deco import keyword

class BreedsLibrary:

    @keyword("Validate Breed Contract")
    def validate_breed_contract(self, breeds):

        required_fields = ["breed", "country", "origin", "coat", "pattern"]

        for item in breeds:
            for field in required_fields:
                if field not in item:
                    raise AssertionError(f"Campo obrigatório ausente: {field}")

                if not isinstance(item[field], str):
                    raise AssertionError(f"O campo {field} deve ser do tipo string")