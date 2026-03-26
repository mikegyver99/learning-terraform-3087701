module "qa" {
    source = "../../modules/blog"

    environment= {
        name ="qa"
        network_prefix = "10.1"
    }

    min_size = 0  # save money do not provision
    max_size = 1
}