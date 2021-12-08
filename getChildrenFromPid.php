$user = user_load(1);
$repository = islandora_get_tuque_connection($user);

$query = <<<EOQ
SELECT ?pid
FROM <#ri>
WHERE {
?pid <http://islandora.ca/ontology/relsext#$relationship> <info:fedora/$pid> ;
}
EOQ;

$results = $repository->repository->ri->sparqlQuery($query);
foreach ($results as $result) {
  echo $result['pid']['value'] . "\n";
}
