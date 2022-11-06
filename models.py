from pydantic import BaseModel


class Patch(BaseModel):
    op: str
    path: str = "/spec/template/spec/nodeSelector"
    value: dict[str, str]
