return {
  "nvim-tree/nvim-web-devicons",
  config = {
    override = {
      gql = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
      dockerfile = {
        icon = "",
        color = "#1D63ED",
        name = "Dockerfile",
      },
    },
    override_by_filename = {
      ["docker-compose.yaml"] = { icon = "", color = "#1D63ED", name = "Dockerfile" },
      ["docker-compose.yml"] = { icon = "", color = "#1D63ED", name = "Dockerfile" },
      [".dockerignore"] = { icon = "", color = "#1D63ED", name = "Dockerfile" },
    },
  },
}
