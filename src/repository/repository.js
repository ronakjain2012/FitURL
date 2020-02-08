import loginRepository from '@/repository/loginRepository'
import menuRepository from '@/repository/menuRepository'

const repositories = {
  login: loginRepository,
  menu: menuRepository,
}
export default {
  get: name => repositories[name]
}