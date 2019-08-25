import axios from 'axios'
import { state } from '~/store/api'
const baseURL = state().api_url

export default axios.create({
  baseURL
})
