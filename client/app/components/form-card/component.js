import Ember from 'ember';

export default Ember.Component.extend({
  isInProgress: false,
  actions: {
    actionEvent(model) {
      // console.log('actionEvent fired:', this.get('actionEvent'))
      this.get('actionEvent')(model)
    },
    cancel() {
      console.log('cancel from form-card')
      this.sendAction('cancel')
    }
  }
});
