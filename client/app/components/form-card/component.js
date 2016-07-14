import Ember from 'ember';

export default Ember.Component.extend({
  isInProgress: false,
  actions: {
    actionEvent(model) {
      // console.log('actionEvent fired:', this.get('actionEvent'))
      this.get('actionEvent')(model)
    },
    secondaryAction(action) {
      console.log('actionEvent fired:', this.get('secondaryAction'))
      this.get('secondaryAction')()
    },
    cancel() {
      console.log('cancel from form-card')
      this.get('cancel')()
    }
  }
});
