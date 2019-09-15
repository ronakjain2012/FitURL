import repository from '~/repository/repository'
const resourse = 'app/short'

export default {
  add(payload) {
    return repository.post(`${resourse}`,payload)
  },
  find(url) {
    return repository.get(`${resourse}/${url}`)
  }
}
