from Service.Service import SERVICE
from Repository.Repository import REPOSITORY
from Domain.Validatori import VALIDATOR
from UI.consola import *

repo = REPOSITORY('data/players.txt')
validator = VALIDATOR()
srv = SERVICE(repo,validator)
ui = Console(srv)
ui.start()