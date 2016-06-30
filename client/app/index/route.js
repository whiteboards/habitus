import Ember from 'ember';

let pages = [{
  id: 1,
  title: 'About us',
  content: '#About Us and some more generic markdown stuff.',
  alias: 'about-us',
  lastUpdated: 1466616947887, //Date.now() or could be new Date()
  created: 1466616947887 // same as lastUpdated
}, {
  id: 2,
  title: 'Contact Us',
  content: '#Contact Us  ##Drop us a note!',
  alias: 'contact-us',
  lastUpdated: 1466617115896,
  created: 1466617115896
}, {
  id: 3,
  title: 'F.A.Q',
  content: '#Frequently Asked Questions ##here is what we are asked the most',
  alias: 'faq'
}]

export default Ember.Route.extend({
  model() {
    return this.store.findAll('page');
  },
  afterModel(model, transition) {
    if (model.get('length') < 1) {
      this.transitionTo('admin');
    }
  }
})
