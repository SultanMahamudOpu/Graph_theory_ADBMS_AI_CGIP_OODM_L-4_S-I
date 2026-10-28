//* Bismillahir Rahmanir Rahim *\

#include <bits/stdc++.h>
using namespace std;

#define optimize()                \
    ios_base::sync_with_stdio(0); \
    cin.tie(0);                   \
    cout.tie(0);
#define fraction()                \
    cout.unsetf(ios::floatfield); \
    cout.precision(10);           \
    cout.setf(ios::fixed, ios::floatfield);
#define mem(arr, k) memset(arr, k, sizeof(arr))
#define MOD 1000000007
#define sqr(a) ((a) * (a))
#define endl "\n"
typedef long long ll;
typedef double dd;
const double PI = acos(-1);
const double eps = 1e-9;
const int inf = 2000000000;
const ll infLL = 9000000000000000000;
const int N = 2e5 + 123;
ll prfSum[N];

ll gcd(ll a, ll b) { return __gcd(a, b); }
ll lcm(ll a, ll b) { return a * (b / gcd(a, b)); }

const ll mx = 112;
bool inMST[mx];
vector<pair<ll, ll>> adjList[mx]; // {weight, node}

void prims(ll src, ll n)
{
    for (ll i = 0; i < mx; i++) inMST[i] = false;

    ll totalCost = 0;

    // min-heap: {weight, node}
    priority_queue<pair<ll, ll>, vector<pair<ll, ll>>, greater<pair<ll, ll>>> pq;
    pq.push({0, src});

    while (!pq.empty())
    {
        ll w = pq.top().first;
        ll u = pq.top().second;
        pq.pop();

        if (inMST[u]) continue; // already in MST, skip
        inMST[u] = true;
        totalCost += w;

        cout << "Added node " << u << " with edge weight " << w << endl;

        for (auto edge : adjList[u])
        {
            ll weight = edge.first;
            ll v = edge.second;

            if (!inMST[v])
            {
                pq.push({weight, v});
            }
        }
    }

    cout << "Total MST Cost = " << totalCost << endl;
}

void adjacencyList(ll n, ll m)
{
    for (int i = 0; i < m; i++)
    {
        ll u, v, w;
        cin >> u >> v >> w;
        adjList[u].push_back({w, v});
        adjList[v].push_back({w, u}); 
    }
}

int main()
{
    optimize();

    ll n, m, src;
    cin >> n >> m;

    adjacencyList(n, m);

    cin>>src;
    prims(src, n);

}

/*
Input:
5 6 
1 2 4
1 3 2
2 3 1
2 4 5
3 4 8
4 5 2
1
Output:
Added node 1 with edge weight 0
Added node 3 with edge weight 2
Added node 2 with edge weight 1
Added node 4 with edge weight 5
Added node 5 with edge weight 2
Total MST Cost = 10
*/
