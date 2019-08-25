import repository from '~/repository/repository'
const resourse = 'app/session'

export default {
  add(payload) {
    return repository.post(`${resourse}`,payload)
  }
}
