// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FetchRaidTopQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query fetchRaidTop {
      raid_top(order_by: {place: asc}) {
        __typename
        id
        guildName
        fraction
        place
        realm
        progress
      }
    }
    """

  public let operationName: String = "fetchRaidTop"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("raid_top", arguments: ["order_by": ["place": "asc"]], type: .nonNull(.list(.nonNull(.object(RaidTop.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(raidTop: [RaidTop]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "raid_top": raidTop.map { (value: RaidTop) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "raid_top"
    public var raidTop: [RaidTop] {
      get {
        return (resultMap["raid_top"] as! [ResultMap]).map { (value: ResultMap) -> RaidTop in RaidTop(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RaidTop) -> ResultMap in value.resultMap }, forKey: "raid_top")
      }
    }

    public struct RaidTop: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["raid_top"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("guildName", type: .nonNull(.scalar(String.self))),
        GraphQLField("fraction", type: .nonNull(.scalar(String.self))),
        GraphQLField("place", type: .nonNull(.scalar(Int.self))),
        GraphQLField("realm", type: .nonNull(.scalar(String.self))),
        GraphQLField("progress", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, guildName: String, fraction: String, place: Int, realm: String, progress: String) {
        self.init(unsafeResultMap: ["__typename": "raid_top", "id": id, "guildName": guildName, "fraction": fraction, "place": place, "realm": realm, "progress": progress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var guildName: String {
        get {
          return resultMap["guildName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "guildName")
        }
      }

      public var fraction: String {
        get {
          return resultMap["fraction"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fraction")
        }
      }

      public var place: Int {
        get {
          return resultMap["place"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "place")
        }
      }

      public var realm: String {
        get {
          return resultMap["realm"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "realm")
        }
      }

      public var progress: String {
        get {
          return resultMap["progress"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "progress")
        }
      }
    }
  }
}
