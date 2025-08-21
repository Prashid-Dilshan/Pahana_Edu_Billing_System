

# Pahana Edu Bookshop Billing System

Pahana Edu is a leading bookshop in Colombo City, serving hundreds of customers each month.  
This project is a **web-based billing  system** designed to replace the existing manual process with a secure, efficient, and user-friendly platform.

---
<img width="1911" height="915" alt="image" src="https://github.com/user-attachments/assets/e324b4fc-ad70-4aba-8579-73fdddfbcd7a" />
<img width="1907" height="913" alt="image" src="https://github.com/user-attachments/assets/3e03ec12-baa2-4966-ba80-30a89133506f" />


## 🛠️ Tech Stack

- **Frontend:** JSP / HTML5, CSS , Tailwind , JavaScript  
- **Backend:** Java Servlets  
- **Database:** MySQL  
- **Build Tool:** Maven  
- **Deployment:** Tomcat Server  
- **Version Control:** Git + GitHub  
- **CI/CD:** GitHub Actions (workflow automation)  

---


## 📂 Project Structure

```plaintext
src
│──main/
├── java/
├────com.example.pahanaedu_billing_system/
│   ├── controller/
│   │   ├── AddCustomerServlet.java
│   │   ├── AdminBillsManageServlet.java
│   │   ├── AdminBooksManageServlet.java
│   │   ├── AdminLoginServlet.java
│   │   ├── AdminManageCustomerServlet.java
│   │   ├── AdminManageStaffServlet.java
│   │   ├── ConfirmGenerateBillServlet.java
│   │   ├── GenerateBillServlet.java
│   │   ├── GetBookPhotoServlet.java
│   │   ├── SelectBooksServlet.java
│   │   ├── SelectCustomerServlet.java
│   │   ├── StaffBillsManageServlet.java
│   │   ├── StaffCartManageServlet.java
│   │   ├── StaffLoginServlet.java
│   ├── dao/
│   │   ├── AdminManageStaffDAO.java
│   │   ├── BillDAO.java
│   │   ├── BookDAO.java
│   │   ├── CustomerDAO.java
│   │   ├── StaffDAO.java
│   ├── dto/
│   │   ├── AdminLoginDTO.java
│   │   ├── AdminManageCustomerDTO.java
│   │   ├── AdminManageStaffDTO.java
│   │   ├── BillDTO.java
│   │   ├── BillItemDTO.java
│   │   ├── CustomerDTO.java
│   │   ├── GetBookPhotoDTO.java
│   │   ├── StaffBillsManageCustomerDTO.java
│   │   ├── StaffBillsManageDTO.java
│   │   ├── StaffBillsManageItemDTO.java
│   │   ├── StaffCartManageDTO.java
│   │   ├── StaffLoginDTO.java
│   │   ├── StaffSelectBooksDTO.java
│   │   ├── StaffSelectCustomerDTO.java
│   ├── mapper/
│   │   ├── AdminManageCustomerMapper.java
│   │   ├── AdminManageStaffMapper.java
│   │   ├── BillItemMapper.java
│   │   ├── BillMapper.java
│   │   ├── BookMapper.java
│   │   ├── CustomerMapper.java
│   │   ├── GetBookPhotoMapper.java
│   │   ├── StaffBillsManageMapper.java
│   │   ├── StaffCartManageMapper.java
│   │   ├── StaffLoginMapper.java
│   │   ├── StaffSelectBooksMapper.java
│   │   ├── StaffSelectCustomerMapper.java
│   ├── model/
│   │   ├── Bill.java
│   │   ├── BillItem.java
│   │   ├── Book.java
│   │   ├── CartItem.java
│   │   ├── Customer.java
│   │   ├── Staff.java
│   └── service/
│   │   ├── AdminLoginService.java
│   │   ├── AdminManageCustomerService.java
│   │   ├── AdminManageStaffService.java
│   │   ├── BillService.java
│   │   ├── BookService.java
│   │   ├── CustomerService.java
│   │   ├── GetBookPhotoService.java
│   │   ├── StaffBillsManageService.java
│   │   ├── StaffCartManageService.java
│   │   ├── StaffLoginService.java
│   │   ├── StaffSelectBooksService.java
│   │   ├── StaffSelectCustomerService.java
├── webapp/
│   ├── admin_add_book.jsp
│   ├── admin_customer_manage.jsp
│   ├── admin_customer_manage.jsp
│   ├── admin_dashboard.html
│   ├── admin_edit_book.jsp
│   ├── Admin_edit_staff.jsp
│   ├── Admin_home.jsp
│   ├── admin_login.jsp
│   └── admin_view_bills.jsp
│   ├── admin_view_books.jsp
│   ├── Admin_view_staff.jsp
│   ├── bill_success.jsp
│   ├── login.html
│   ├── staff_add_customer.jsp
│   ├── staff_cart.jsp
│   ├── staff_dashboard.html
│   ├── staff_display_bills.jsp
│   ├── staff_final_bill_details.jsp
│   ├── staff_guideline.jsp
│   ├── staff_home.jsp
│   ├── staff_login.jsp
│   ├── staff_select_books.jsp
│   ├── staff_select_customer.jsp
│   ├── staff_view_customers.jsp
```


---

