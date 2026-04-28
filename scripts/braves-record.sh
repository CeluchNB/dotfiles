
year=$(date +%Y)
response=$(curl -s "https://statsapi.mlb.com/api/v1/standings?leagueId=104&season=${year}" | jq '.records.[0].teamRecords.[0].leagueRecord')
echo "$response" | jq -r '"\(.wins) - \(.losses)"'
