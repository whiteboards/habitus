import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo } from 'ember-data/relationships';

export default Model.extend({
  content: attr('string'),
  insertedAt: attr('date'),
  updatedAt: attr('date'),
  user: belongsTo('user'),
  page: belongsTo('page'),
  post: belongsTo('post')
});
