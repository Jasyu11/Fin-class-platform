package entity;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.io.IOUtils; 
import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;

public class enterprise {
	String name;
	float registered_capital; //ע���ʱ�
	float shareholding_ratio; //�ֹɱ���
	int type; //�������
	float ent_contribution;//��ҵ������Ϣ�Ͻɳ��ʶ�
	float ent_contribution_year_subscription;//��ҵ�걨��Ϣ�Ͻɶ�
	float ent_contribution_year_paid;//��ҵ�걨��Ϣʵ�ɶ� 
	//sade���������
	float sade1;
	String description;
	float sade2;
	float sade3;
	float sade4;
	float sade5;
	float sade6;
	float sade7;
	float sade8;
	public float avg_ent_contribution=(float) 138.5452841;
	public float variance_ent_contribution=(float) 299.4156028;
	public float avg_registered_capital=(float) 220.6050266;
	public float variance_registered_capital=(float) 472.1266219;
	public float avg_ent_contribution_year_subscription=(float) 689194.4581;
	public float variance_ent_contribution_year_subscription=184644318;
	public float avg_shareholding_ratio=(float) 29.67934596;
	public float variance_shareholding_ratio=(float) 36.11978271;
	public float avg_ent_contribution_year_paid=(float) 6190.18883;
	public float variance_ent_contribution_year_paid=(float) 249956.7514;
	public float number_of_employees;//ְ������
	public float onlineshop_number;//��������
	public float number_of_branches;//��ҵ��֧��
	//ʧ��ָ��
	public float whether_break_promise; //�Ƿ�Ϊ���Ų�ʧ����ҵ
	public float blacklist_or_not;//�Ƿ����������
	public float abnormal_time;//��ҵ�쳣����
	public String ent_credit_rank; //��ҵ���õȼ�
	public float accumulated_tax_arrears;//��ҵ�ۼ�Ƿ˰��
	public float number_of_penalty;//������������
	public float time_of_comprehensive_punishment;//��ҵ�ۺϴ�������
	//����ָ��
	public float intellectual_property_rights;//֪ʶ��Ȩ��
	public float whether_wellknown_trademark;//�Ƿ�����̱�
	public float number_of_patent_applications;//ר���������
	public float whether_famous_trademark;//�Ƿ������̱�
	public float number_of_copyright_application;//����Ȩ�������
	public float whether_keep_promise;//�Ƿ�Ϊ�������غ�ͬ��ҵ
	
	public float busssiness_category;//��ҵ����

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getShareholding_ratio() {
		return shareholding_ratio;
	}
	public void setShareholding_ratio(float shareholding_ratio) {
		this.shareholding_ratio = shareholding_ratio;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public float getEnt_contribution() {
		return ent_contribution;
	}
	public void setEnt_contribution(float ent_contribution) {
		this.ent_contribution = ent_contribution;
	}
	public float getEnt_contribution_year_subscription() {
		return ent_contribution_year_subscription;
	}
	public void setEnt_contribution_year_subscription(float ent_contribution_year_subscription) {
		this.ent_contribution_year_subscription = ent_contribution_year_subscription;
	}
	public float getEnt_contribution_year_paid() {
		return ent_contribution_year_paid;
	}
	public void setEnt_contribution_year_paid(float ent_contribution_year_paid) {
		this.ent_contribution_year_paid = ent_contribution_year_paid;
	}
	
	
	public enterprise code(enterprise ent) throws FileNotFoundException, IOException {
		try (Graph graph = new Graph()) { 
			byte[] graphBytes = IOUtils.toByteArray(new FileInputStream("ServiceCompetition/new/encoder.pb"));
			graph.importGraphDef(graphBytes);
 
			try (Session session = new Session(graph)) {
				float[][]  a= {{(ent.ent_contribution-ent.avg_ent_contribution)/ent.variance_ent_contribution
					,(ent.registered_capital-ent.avg_registered_capital)/ent.variance_registered_capital
					,(ent.ent_contribution_year_subscription-ent.avg_ent_contribution_year_subscription)/ent.variance_ent_contribution_year_subscription,
					(ent.shareholding_ratio-ent.avg_shareholding_ratio)/ent.variance_shareholding_ratio,
					(ent.ent_contribution_year_paid-ent.avg_ent_contribution_year_paid)/ent.variance_ent_contribution_year_paid}};
				Tensor<?> out = session.runner().feed("input_1", Tensor.create(a)).fetch("output_1").run().get(0);
				float[] r = new float[8];
				out.copyTo(r);
				ent.setSade1(r[0]);
				ent.setSade2(r[1]);
				ent.setSade3(r[2]);
				ent.setSade4(r[3]);
				ent.setSade5(r[4]);
				ent.setSade6(r[5]);
				ent.setSade7(r[6]);
				ent.setSade8(r[7]);
				return ent;
				
			}
	}
}
	public enterprise calculate_cluster(enterprise ent1,List<enterprise> list) {
		float  distance=Float.POSITIVE_INFINITY;
		for(int i=0;i<list.size();i++) {
			enterprise ent=list.get(i);
			 float current_distance=(float) Math.pow((ent1.getSade1()-ent.getSade1()),2)+
					 (float) Math.pow((ent1.getSade2()-ent.getSade2()),2)+
					 (float) Math.pow((ent1.getSade3()-ent.getSade3()),2)+
					 (float) Math.pow((ent1.getSade4()-ent.getSade4()),2)+
					 (float) Math.pow((ent1.getSade5()-ent.getSade5()),2)+
					 (float) Math.pow((ent1.getSade6()-ent.getSade6()),2)+
					 (float) Math.pow((ent1.getSade7()-ent.getSade7()),2)+
					 (float) Math.pow((ent1.getSade8()-ent.getSade8()),2);
			 if(current_distance<distance) {
				 distance=current_distance;
				 ent1.setType(ent.getType());
				 ent1.setDescription(ent.getDescription());
			 }
		}
		return ent1;
	}
	public float getSade1() {
		return sade1;
	}
	public void setSade1(float sade1) {
		this.sade1 = sade1;
	}
	public float getSade2() {
		return sade2;
	}
	public void setSade2(float sade2) {
		this.sade2 = sade2;
	}
	public float getSade3() {
		return sade3;
	}
	public void setSade3(float sade3) {
		this.sade3 = sade3;
	}
	public float getSade4() {
		return sade4;
	}
	public void setSade4(float sade4) {
		this.sade4 = sade4;
	}
	public float getSade5() {
		return sade5;
	}
	public void setSade5(float sade5) {
		this.sade5 = sade5;
	}
	public float getSade6() {
		return sade6;
	}
	public void setSade6(float sade6) {
		this.sade6 = sade6;
	}
	public float getSade7() {
		return sade7;
	}
	public void setSade7(float sade7) {
		this.sade7 = sade7;
	}
	public float getSade8() {
		return sade8;
	}
	public void setSade8(float sade8) {
		this.sade8 = sade8;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getWhether_break_promise() {
		return whether_break_promise;
	}
	public void setWhether_break_promise(float f) {
		this.whether_break_promise = f;
	}
	public float getBlacklist_or_not() {
		return blacklist_or_not;
	}
	public void setBlacklist_or_not(float blacklist_or_not) {
		this.blacklist_or_not = blacklist_or_not;
	}
	public float getAbnormal_time() {
		return abnormal_time;
	}
	public void setAbnormal_time(float abnormal_time) {
		this.abnormal_time = abnormal_time;
	}
	public String getEnt_credit_rank() {
		return ent_credit_rank;
	}
	public void setEnt_credit_rank(String ent_credit_rank) {
		this.ent_credit_rank = ent_credit_rank;
	}
	public float getAccumulated_tax_arrears() {
		return accumulated_tax_arrears;
	}
	public void setAccumulated_tax_arrears(float accumulated_tax_arrears) {
		this.accumulated_tax_arrears = accumulated_tax_arrears;
	}
	public float getTime_of_comprehensive_punishment() {
		return time_of_comprehensive_punishment;
	}
	public void setTime_of_comprehensive_punishment(float time_of_comprehensive_punishment) {
		this.time_of_comprehensive_punishment = time_of_comprehensive_punishment;
	}
	public float getIntellectual_property_rights() {
		return intellectual_property_rights;
	}
	public void setIntellectual_property_rights(float intellectual_property_rights) {
		this.intellectual_property_rights = intellectual_property_rights;
	}
	public float getNumber_of_patent_applications() {
		return number_of_patent_applications;
	}
	public void setNumber_of_patent_applications(float number_of_patent_applications) {
		this.number_of_patent_applications = number_of_patent_applications;
	}
	public float getWhether_famous_trademark() {
		return whether_famous_trademark;
	}
	public void setWhether_famous_trademark(float whether_famous_trademark) {
		this.whether_famous_trademark = whether_famous_trademark;
	}
	public float getNumber_of_copyright_application() {
		return number_of_copyright_application;
	}
	public void setNumber_of_copyright_application(float number_of_copyright_application) {
		this.number_of_copyright_application = number_of_copyright_application;
	}
	public float getWhether_keep_promise() {
		return whether_keep_promise;
	}
	public void setWhether_keep_promise(float whether_keep_promise) {
		this.whether_keep_promise = whether_keep_promise;
	}
	public float getWhether_wellknown_trademark() {
		return whether_wellknown_trademark;
	}
	public void setWhether_wellknown_trademark(float whether_wellknown_trademark) {
		this.whether_wellknown_trademark = whether_wellknown_trademark;
	}
	public float getRegistered_capital() {
		return registered_capital;
	}
	public void setRegistered_capital(float registered_capital) {
		this.registered_capital = registered_capital;
	}
	public float getBusssiness_category() {
		return busssiness_category;
	}
	public void setBusssiness_category(float busssiness_category) {
		this.busssiness_category = busssiness_category;
	}
	public float getOnlineshop_number() {
		return onlineshop_number;
	}
	public void setOnlineshop_number(float onlineshop_number) {
		this.onlineshop_number = onlineshop_number;
	}
	public float getNumber_of_employees() {
		return number_of_employees;
	}
	public void setNumber_of_employees(float number_of_employees) {
		this.number_of_employees = number_of_employees;
	}
	public float getNumber_of_branches() {
		return number_of_branches;
	}
	public void setNumber_of_branches(float number_of_branches) {
		this.number_of_branches = number_of_branches;
	}
	public float getNumber_of_penalty() {
		return number_of_penalty;
	}
	public void setNumber_of_penalty(float number_of_penalty) {
		this.number_of_penalty = number_of_penalty;
	}
}
