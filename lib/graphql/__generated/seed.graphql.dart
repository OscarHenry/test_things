import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$BasicTestSeed {
  Mutation$BasicTestSeed({
    required this.basicTestSeed,
    required this.$__typename,
  });

  factory Mutation$BasicTestSeed.fromJson(Map<String, dynamic> json) {
    final l$basicTestSeed = json['basicTestSeed'];
    final l$$__typename = json['__typename'];
    return Mutation$BasicTestSeed(
      basicTestSeed: (l$basicTestSeed as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String basicTestSeed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$basicTestSeed = basicTestSeed;
    _resultData['basicTestSeed'] = l$basicTestSeed;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$basicTestSeed = basicTestSeed;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$basicTestSeed,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$BasicTestSeed) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$basicTestSeed = basicTestSeed;
    final lOther$basicTestSeed = other.basicTestSeed;
    if (l$basicTestSeed != lOther$basicTestSeed) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$BasicTestSeed on Mutation$BasicTestSeed {
  CopyWith$Mutation$BasicTestSeed<Mutation$BasicTestSeed> get copyWith =>
      CopyWith$Mutation$BasicTestSeed(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$BasicTestSeed<TRes> {
  factory CopyWith$Mutation$BasicTestSeed(
    Mutation$BasicTestSeed instance,
    TRes Function(Mutation$BasicTestSeed) then,
  ) = _CopyWithImpl$Mutation$BasicTestSeed;

  factory CopyWith$Mutation$BasicTestSeed.stub(TRes res) =
      _CopyWithStubImpl$Mutation$BasicTestSeed;

  TRes call({
    String? basicTestSeed,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$BasicTestSeed<TRes>
    implements CopyWith$Mutation$BasicTestSeed<TRes> {
  _CopyWithImpl$Mutation$BasicTestSeed(
    this._instance,
    this._then,
  );

  final Mutation$BasicTestSeed _instance;

  final TRes Function(Mutation$BasicTestSeed) _then;

  static const _undefined = {};

  TRes call({
    Object? basicTestSeed = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$BasicTestSeed(
        basicTestSeed: basicTestSeed == _undefined || basicTestSeed == null
            ? _instance.basicTestSeed
            : (basicTestSeed as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$BasicTestSeed<TRes>
    implements CopyWith$Mutation$BasicTestSeed<TRes> {
  _CopyWithStubImpl$Mutation$BasicTestSeed(this._res);

  TRes _res;

  call({
    String? basicTestSeed,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationBasicTestSeed = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'BasicTestSeed'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'basicTestSeed'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userID'),
            value: StringValueNode(
              value: '341f281b-5587-4792-9573-40ae5930025d',
              isBlock: false,
            ),
          )
        ],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$BasicTestSeed _parserFn$Mutation$BasicTestSeed(
        Map<String, dynamic> data) =>
    Mutation$BasicTestSeed.fromJson(data);
typedef OnMutationCompleted$Mutation$BasicTestSeed = FutureOr<void> Function(
  dynamic,
  Mutation$BasicTestSeed?,
);

class Options$Mutation$BasicTestSeed
    extends graphql.MutationOptions<Mutation$BasicTestSeed> {
  Options$Mutation$BasicTestSeed({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$BasicTestSeed? onCompleted,
    graphql.OnMutationUpdate<Mutation$BasicTestSeed>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$BasicTestSeed(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationBasicTestSeed,
          parserFn: _parserFn$Mutation$BasicTestSeed,
        );

  final OnMutationCompleted$Mutation$BasicTestSeed? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$BasicTestSeed
    extends graphql.WatchQueryOptions<Mutation$BasicTestSeed> {
  WatchOptions$Mutation$BasicTestSeed({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationBasicTestSeed,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$BasicTestSeed,
        );
}

extension ClientExtension$Mutation$BasicTestSeed on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$BasicTestSeed>> mutate$BasicTestSeed(
          [Options$Mutation$BasicTestSeed? options]) async =>
      await this.mutate(options ?? Options$Mutation$BasicTestSeed());
  graphql.ObservableQuery<Mutation$BasicTestSeed> watchMutation$BasicTestSeed(
          [WatchOptions$Mutation$BasicTestSeed? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$BasicTestSeed());
}

class Mutation$BasicTestSeed$HookResult {
  Mutation$BasicTestSeed$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$BasicTestSeed runMutation;

  final graphql.QueryResult<Mutation$BasicTestSeed> result;
}

Mutation$BasicTestSeed$HookResult useMutation$BasicTestSeed(
    [WidgetOptions$Mutation$BasicTestSeed? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$BasicTestSeed());
  return Mutation$BasicTestSeed$HookResult(
    ({optimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$BasicTestSeed> useWatchMutation$BasicTestSeed(
        [WatchOptions$Mutation$BasicTestSeed? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$BasicTestSeed());

class WidgetOptions$Mutation$BasicTestSeed
    extends graphql.MutationOptions<Mutation$BasicTestSeed> {
  WidgetOptions$Mutation$BasicTestSeed({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$BasicTestSeed? onCompleted,
    graphql.OnMutationUpdate<Mutation$BasicTestSeed>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$BasicTestSeed(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationBasicTestSeed,
          parserFn: _parserFn$Mutation$BasicTestSeed,
        );

  final OnMutationCompleted$Mutation$BasicTestSeed? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$BasicTestSeed
    = graphql.MultiSourceResult<Mutation$BasicTestSeed> Function(
        {Object? optimisticResult});
typedef Builder$Mutation$BasicTestSeed = widgets.Widget Function(
  RunMutation$Mutation$BasicTestSeed,
  graphql.QueryResult<Mutation$BasicTestSeed>?,
);

class Mutation$BasicTestSeed$Widget
    extends graphql_flutter.Mutation<Mutation$BasicTestSeed> {
  Mutation$BasicTestSeed$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$BasicTestSeed? options,
    required Builder$Mutation$BasicTestSeed builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$BasicTestSeed(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({optimisticResult}) => run(
              const {},
              optimisticResult: optimisticResult,
            ),
            result,
          ),
        );
}
