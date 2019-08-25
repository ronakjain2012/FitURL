/* eslint-disable no-useless-escape */
export const INVALID_URL_ALIAS = /[~`!#$ .%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g
export const INVALID_USERNAME = /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/
export const VALID_EMAIL = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
export const VALID_MOBILE = /^(\+7|7|8)?[\s-]?\(?([0-9]{3})\)?[\s-]?([0-9]{3})[\s-]?([0-9]{2})[\s-]?([0-9]{2}).*$/gm
export const DOMAIN_MATCH = /:\/\/(.[^/]+)/
export const VALID_ALHANUMARIC = /^[a-z0-9]+$/i
export const VALID_INTERGER = /^\d+$/
export const VALID_DECIMAL = /^[0-9]+\.?[0-9]*$/
export const VALID_ALHANUMARIC_WITH_UNDERSCORE = /^[A-Za-z]\w*$/
export const VALID_PASSWORD = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[_\W]).{12,20}$/ // Minimum ten and maximum 20 characters,one uppercase, lowercase, number, special character
export const VALID_SPECIAL_CHARECTER_ONLY = /[~`!$%\^&+=\[\]';{}|":<>\?]/

export const ALL = {
  INVALID_URL_ALIAS,
  INVALID_USERNAME,
  VALID_EMAIL,
  VALID_MOBILE,
  DOMAIN_MATCH,
  VALID_ALHANUMARIC,
  VALID_INTERGER,
  VALID_DECIMAL,
  VALID_ALHANUMARIC_WITH_UNDERSCORE,
  VALID_PASSWORD,
  VALID_SPECIAL_CHARECTER_ONLY
}
