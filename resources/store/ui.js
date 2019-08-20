export const state = () => {
  return {
    snackbar: {
      show: false,
      color: '',
      mode: 'vertical',
      text: 'Testing',
      timeout: 5000,
      x: 'right',
      y: 'top',
      multiline: true
    },
    loader: false,
    dialog: {
      show: false,
      title: '',
      content: '',
      showConfirm: false,
      showCloseOnly: true,
      action: null
    }
  }
}

export const mutations = {
  SetShowSnackbar(state, text) {
    state.snackbar.text = text
    state.snackbar.show = true
  },
  SetHideSnackbar(state) {
    state.snackbar.show = false
  },
  SetShowLoader(state) {
    state.loader = true
  },
  SetHideLoader(state) {
    state.loader = false
  },
  SetShowDialog(state, { title, content, showConfirm, showCloseOnly }) {
    state.dialog.show = true
    state.dialog.title = title
    state.dialog.content = content
    if (showConfirm) {
      state.dialog.showConfirm = true
      state.dialog.showCloseOnly = false
    }
    if (showCloseOnly) {
      state.dialog.showCloseOnly = true
      state.dialog.showConfirm = false
    }
    state.dialog.action = null
  },
  SetHideDialog(state) {
    state.dialog.show = false
    state.dialog.showCloseOnly = true
    state.dialog.showConfirm = false
  },
  SetDialogAction(state, status) {
    state.dialog.action = status
    state.dialog.show = false
  }
}

export const getters = {
  getSnackbar(state) {
    return state.snackbar
  },
  getDialogAction(state) {
    return state.dialog.action
  },
  getDialog(state) {
    return state.dialog
  }
}

export const actions = {
  showSnackbar({ commit }, { text }) {
    commit('SetShowSnackbar', text)
  },
  hideSnackbar({ commit }) {
    commit('SetHideSnackbar')
  },
  showLoader({ commit }) {
    commit('SetShowLoader')
  },
  hideLoader({ commit }) {
    commit('SetHideLoader')
  },
  showDialog({ commit }, { title, content, showConfirm, showCloseOnly }) {
    commit('SetShowDialog', { title, content, showConfirm, showCloseOnly })
  },
  hideDialog({ commit }) {
    commit('SetHideDialog')
  },
  async dialogAction({ commit }, status) {
    await commit('SetDialogAction', status)
  }
}
