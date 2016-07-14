import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo, hasMany } from 'ember-data/relationships';

export default Model.extend({
  title: attr('string'),
  content: attr('string'),
  user: belongsTo('user'),
  insertedAt: attr('date'),
  updatedAt: attr('date'),
  comments: hasMany('comments'),
  tags: hasMany('tags')
});
