echo "Packaging Bundle..."
packageNum=`./testRabbitMQClient.php apiPackage-v | xargs`
	apiScrDIR=$HOME/git/api_server/
		cp -a $apiScrDIR* temp/
	tar -czvf apiPackage-v"$packageNum".tar.gz -C temp/ . 
		rm -r temp/api_server/
        echo `ls | grep apiPackage-v"$packageNum"`
		echo "Bundle Complete"
	cd temp/
	# Scp package to the deploy server
	echo "Sending to deploy server..."
	scp -r apiPackage-v"$packageNum".tar.gz uzair@192.168.2.30:/home/uzair/Packages/
	
	cp apiPackage-v"$packageNum".tar.gz apiPackages/
	rm apiPackage-v"$packageNum".tar.gz
	cd ..
	php updatePackage.php apiPackage-v"$packageNum".tar.gz "$packageNum"
	echo "Packaging Complete! Sent to Deployment Server."

