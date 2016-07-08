import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    actionEvent(model) {
      console.log('actionEvent fired:', this.get('actionEvent'))
      this.get('actionEvent')(model)
    },
  }
});
