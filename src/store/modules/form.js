export default {
  state: {
    formItems: {}
  },
  actions: {},
  mutations: {
    SET_FORM_ITEMS: (state, items) => {
      state.formItems = items;
    }
  },
  getters: {
    getFomItems: state => state.formItems
  }
};
