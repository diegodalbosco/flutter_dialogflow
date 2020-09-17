import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Represents the parameters of the conversational query.
class QueryParameters {
  /// The time zone of this conversational query from the time zone database, e.g., America/New_York, Europe/Paris. If not provided, the time zone specified in agent settings is used.
  final String timeZone;

  /// The geo location of this conversational query.
  final LatLng geoLocation;

  /// The collection of contexts to be activated before this query is executed.
  final List<Context> contexts;

  /// Specifies whether to delete all contexts in the current session before the new ones are activated.
  final bool resetContexts;

  /// Additional session entity types to replace or extend developer entity types with. The entity synonyms apply to all languages and persist for the session of this query.
  final List<SessionEntityType> sessionEntityTypes;

  /// This field can be used to pass custom data into the webhook associated with the agent. Arbitrary JSON objects are supported.
  final Map<String, dynamic> payload;

  ///Knowledge based list - used for accessing responses based on knowledge base functionality
  final List<String> knowledgeBaseNames;

  QueryParameters({
    this.timeZone,
    this.geoLocation,
    this.contexts,
    this.resetContexts,
    this.sessionEntityTypes,
    this.payload,
    this.knowledgeBaseNames,
  });

  static QueryParameters fromJson(Map<String, dynamic> json) => QueryParameters(
        timeZone: json['timeZone'],
        geoLocation: json['geoLocation'] == null
            ? null
            : LatLng.fromJson(json['geoLocation']),
        contexts: json['contexts'] == null
            ? null
            : List.from(json['contexts'])
                .map((c) => Context.fromJson(c))
                .toList(),
        resetContexts: json['resetContexts'],
        sessionEntityTypes: json['sessionEntityTypes'] == null
            ? null
            : List.from(json['sessionEntityTypes'])
                .map((s) => SessionEntityType.fromJson(s))
                .toList(),
        payload: json['payload'],
        knowledgeBaseNames: json['knowledgeBaseNames'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeZone': timeZone,
        'geoLocation': geoLocation == null ? null : geoLocation.toJson(),
        'contexts':
            contexts == null ? null : contexts.map((c) => c.toJson()).toList(),
        'resetContexts': resetContexts,
        'sessionEntityTypes': sessionEntityTypes == null
            ? null
            : sessionEntityTypes.map((s) => s.toJson()).toList(),
        'payload': payload,
        'knowledgeBaseNames': knowledgeBaseNames,
      };
}
