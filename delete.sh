#This is a one step script to delete all the deployment and
#services executed during the execution of the cluster

# kubectl delete deployment hyperledger-fabric-ca
# kubectl delete deployment hyperledger-fabric-cli
# kubectl delete deployment hyperledger-orderer
# kubectl delete deployment hyperledger-peer0-org1
# kubectl delete deployment hyperledger-peer0-org2
# kubectl delete deployment hyperledger-peer1-org1
# kubectl delete deployment hyperledger-peer1-org2

# kubectl delete svc orderer-service
# kubectl delete svc peer0-org1
# kubectl delete svc peer1-org1
# kubectl delete svc peer0-org2
# kubectl delete svc peer1-org2
# kubectl delete svc ca

#!/bin/bash

#comment this if you don't want to use the default CHANNEL_NAME "mychannel"
#to create your channel, mannually run:
# $ bash generateArtifacts.sh <CHANNEL_NAME>
# bash driving-files/generateArtifacts.sh
#
# bash driving-files/prepare-files.sh

echo "Deleting ca"
kubectl delete -f local/ca.yaml
sleep 10

echo "Deleting orderer"
kubectl delete -f local/orderer.yaml
sleep 10


echo "Deleting Peer0"
kubectl delete -f local/peer0.yaml
sleep 10

echo "Deleting rest of the Peers"
kubectl delete -f local/peer1.yaml -f local/peer2.yaml -f local/peer3.yaml

sleep 5

echo "Deleting Cli"
kubectl delete -f local/cli.yaml

echo "**********Deleting done successfully**********"
