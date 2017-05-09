echo "Packaging Bundle..."
packageNum=`./testRabbitMQClient.php apiPackage-v | xargs`
	mkdir temp/
	apiScrDIR=$HOME/git/api_server/
		cp -a $apiScrDIR* temp/
	tar -czvf apiPackage-v"$packageNum".tar.gz -C temp/ . 
		rm -r temp
        echo `ls | grep apiPackage-v"$packageNum"`
		echo "Bundle Complete"
	# Scp package to the deploy server
	echo "Sending to deploy server..."
	scp -r apiPackage-v"$packageNum".tar.gz uzair@192.168.2.30:/home/uzair/Packages/.	
	cp apiPackage-v"$packageNum".tar.gz apiPackages/
	rm apiPackage-v"$packageNum".tar.gz
	php updatePackage.php "$packageNum"
	echo "Packaging Complete! Sent to Deployment Server."

