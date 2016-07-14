import Ember from 'ember';

export default Ember.Route.extend({
  actions:{
    transition: function(){
      this.transitionTo('admin');
    }
  }
});