// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MovieDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MovieDetail($id: Int = 15) {
      movies {
        __typename
        movie(id: $id) {
          __typename
          id
          title
          rating
          poster(size: W500)
          details {
            __typename
            overview
          }
          releaseDate
        }
      }
    }
    """

  public let operationName: String = "MovieDetail"

  public let operationIdentifier: String? = "1d1256b16f458465fe0534d12284a0066e33869e3c8c351bbe4765a9d59f4c88"

  public var id: Int?

  public init(id: Int? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", type: .nonNull(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: Movie) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.resultMap])
    }

    public var movies: Movie {
      get {
        return Movie(unsafeResultMap: resultMap["movies"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movies"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("movie", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Movie.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(movie: Movie) {
        self.init(unsafeResultMap: ["__typename": "Movies", "movie": movie.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var movie: Movie {
        get {
          return Movie(unsafeResultMap: resultMap["movie"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "movie")
        }
      }

      public struct Movie: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DetailedMovie"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
            GraphQLField("poster", arguments: ["size": "W500"], type: .scalar(String.self)),
            GraphQLField("details", type: .nonNull(.object(Detail.selections))),
            GraphQLField("releaseDate", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: String, rating: Double, poster: String? = nil, details: Detail, releaseDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DetailedMovie", "id": id, "title": title, "rating": rating, "poster": poster, "details": details.resultMap, "releaseDate": releaseDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var rating: Double {
          get {
            return resultMap["rating"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
          }
        }

        public var poster: String? {
          get {
            return resultMap["poster"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "poster")
          }
        }

        public var details: Detail {
          get {
            return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "details")
          }
        }

        public var releaseDate: String? {
          get {
            return resultMap["releaseDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "releaseDate")
          }
        }

        public struct Detail: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DetailedMovie"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("overview", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(overview: String) {
            self.init(unsafeResultMap: ["__typename": "DetailedMovie", "overview": overview])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var overview: String {
            get {
              return resultMap["overview"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "overview")
            }
          }
        }
      }
    }
  }
}

public final class MovieListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MovieList($limit: Int = 15) {
      movies {
        __typename
        topRated(first: $limit) {
          __typename
          edges {
            __typename
            node {
              __typename
              id
              title
              rating
              poster(size: W500)
              releaseDate
            }
          }
        }
      }
    }
    """

  public let operationName: String = "MovieList"

  public let operationIdentifier: String? = "8a533706dc5b75bfcba31972c133e453632443a04a107c754a228df2b6777f3e"

  public var limit: Int?

  public init(limit: Int? = nil) {
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", type: .nonNull(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: Movie) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.resultMap])
    }

    public var movies: Movie {
      get {
        return Movie(unsafeResultMap: resultMap["movies"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movies"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("topRated", arguments: ["first": GraphQLVariable("limit")], type: .nonNull(.object(TopRated.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(topRated: TopRated) {
        self.init(unsafeResultMap: ["__typename": "Movies", "topRated": topRated.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var topRated: TopRated {
        get {
          return TopRated(unsafeResultMap: resultMap["topRated"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "topRated")
        }
      }

      public struct TopRated: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MovieConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MovieConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MovieEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "MovieEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["DetailedMovie", "Movie", "MovieResult"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
                GraphQLField("poster", arguments: ["size": "W500"], type: .scalar(String.self)),
                GraphQLField("releaseDate", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeDetailedMovie(id: Int, title: String, rating: Double, poster: String? = nil, releaseDate: String? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DetailedMovie", "id": id, "title": title, "rating": rating, "poster": poster, "releaseDate": releaseDate])
            }

            public static func makeMovie(id: Int, title: String, rating: Double, poster: String? = nil, releaseDate: String? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "rating": rating, "poster": poster, "releaseDate": releaseDate])
            }

            public static func makeMovieResult(id: Int, title: String, rating: Double, poster: String? = nil, releaseDate: String? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MovieResult", "id": id, "title": title, "rating": rating, "poster": poster, "releaseDate": releaseDate])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            public var rating: Double {
              get {
                return resultMap["rating"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "rating")
              }
            }

            public var poster: String? {
              get {
                return resultMap["poster"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "poster")
              }
            }

            public var releaseDate: String? {
              get {
                return resultMap["releaseDate"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "releaseDate")
              }
            }
          }
        }
      }
    }
  }
}
