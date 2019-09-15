import repository from '~/repository/repository'
const resourse = 'app/visit'

export default {
  update(payload) {
    return repository.post(`${resourse}`,payload)
  },
}
