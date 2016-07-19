import Ember from 'ember';

export default Ember.Component.extend({
    session: Ember.inject.service('session'),
    isActive: false,
    actions: {
      invalidateSession() {
        this.get('session').invalidate();
      },
      toggleMenu() {
        this.toggleProperty('isActive')
      }
    }
});
