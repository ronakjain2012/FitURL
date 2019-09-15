import leadRepository from '@/repository/leadRepository'
import maxMindRepository from '@/repository/maxMindRepository'
import quoteRepository from '@/repository/quoteRepository'
import sessionRepository from '@/repository/sessionRepository'
import shortUrlRepository from '@/repository/shortUrlRepository'
import visitLogRepository from '@/repository/visitLogRepository'

const repositories = {
  lead: leadRepository,
  maxMind: maxMindRepository,
  quote: quoteRepository,
  session: sessionRepository,
  shortUrl: shortUrlRepository,
  visit: visitLogRepository
}
export default {
  get: name => repositories[name]
}