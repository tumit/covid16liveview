defmodule Covid66live.Info.Virus do
    # defstruct [:code, :name, :description]
    use Ecto.Schema
    import Ecto.Changeset    
    alias Covid66live.Info.Virus

    schema "viruses" do
        field :code, :string
        field :name, :string
        field :description, :string

        timestamps()
    end

    @doc false
    def changeset(%Virus{} = virus, attrs) do
        virus
        |> cast(attrs, [:code, :name, :description])
    end
end
