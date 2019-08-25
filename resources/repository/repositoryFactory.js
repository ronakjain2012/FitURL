import leadRepository from '@/repository/leadRepository'
import maxmidRepository from '@/repository/maxmidRepository'
import quoteRepository from '@/repository/quoteRepository'
import sessionRepository from '@/repository/sessionRepository'
import shortUrlRepository from '@/repository/shortUrlRepository'

const repositories = {
  lead: leadRepository,
  maxMind: maxmidRepository,
  quote: quoteRepository,
  sessios: sessionRepository,
  shortUrl: shortUrlRepository,
}
export default {
  get: name => repositories[name]
}
