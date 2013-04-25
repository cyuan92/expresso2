module HomeHelper
	#def retrieveAllPatients(email)
	def retrieveAllPatients
		require File.expand_path(File.dirname(__FILE__)+'/../../aws_config')

		# Hard-coded bucket_name. Must be changed later to address multiple patients
		bucket_name = "recordings77"
		#therapist_name = current_therapist.email
		therapist_name = "conyuan"
		# get an instance of the S3 interface using the default configuration
		s3=AWS::S3.new

		# create a bucket
		b = s3.buckets.create(bucket_name)
		html="<h1>Choose your Patient </h1>\n"		
		#html << "<p> Your email " + current_therapist.email
		#html << "<p> Your email: "+email
		# retrieve the filenames of all recordings
		html <<"<ul>\n"
		b.objects.each do |obj|			
			if obj.key.match(therapist_name+"\/+[A-Z a-z]+\/$")								
				patient_name = obj.key.to_s.scan(/([^\/]*)/).third.first
				html << "<li>"+patient_name+"<br/><ul>"
				html << retrieveAllRecordings(b, therapist_name, patient_name).to_s
				html << "</ul></li>\n"				
			end	
		end
		html<<"</ul>"
		html.html_safe		
	end

	def retrieveAllRecordings(bucket, therapist_name, patient_name)		
		result = "\n"		

		# retrieve the filenames of all recordings		
		bucket.objects.each do |obj|	

			if obj.key.match(therapist_name+"\/"+patient_name+"\/~"+"[a-z A-Z 0-9 _ -]+.3gp") 			
				result << "\n<li><a href=\""
				result << obj.url_for(:get,:expires=>10*60).to_s
				timestamp = obj.key.to_s.scan(/([^~]*)/).third.first				
				timeRecorded = timestamp.scan(/([^_]*)/).third.first.scan(/([^.]*)/).first.first.gsub("-",":")
				dateRecorded = timestamp.scan(/([^_]*)/).first.first
				#
				result << "\">"+dateRecorded + " at " + timeRecorded
				#result << "\">"+timestamp+"<br/>"+dateRecorded+"<br/>"+timeRecorded
				result <<"</a></li>\n"
			end
		end
		return result		
	end
	
end
