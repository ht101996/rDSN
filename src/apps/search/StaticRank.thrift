
namespace cpp dsn.app.search
namespace csharp dsn.app.search

struct StringQuery
{
	1: string Query;
}

struct AugmentedQuery
{
    1: i32 QueryId;
    2: StringQuery RawQuery;
    3: StringQuery AlteredQuery;
    4: i32 TopX;
}

struct DocId
{
    1: string URL;
}

struct DocPosition
{
    1: DocId DocIdentity;
    2: i32 Position;
}

struct PerDocStaticRank
{
    1: DocPosition Pos;
    2: i32 StaticRank;
}

struct StaticRankResult
{
    1: AugmentedQuery Query;
    2: list<PerDocStaticRank> Results;
}

service StaticRank
{
    StaticRankResult OnL1Selection(1:AugmentedQuery query);
}