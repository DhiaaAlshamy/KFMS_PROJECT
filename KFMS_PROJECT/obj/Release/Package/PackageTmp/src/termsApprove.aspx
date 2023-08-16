<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="termsApprove.aspx.cs" Inherits="KFMS_PROJECT.src.termsApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Enrolling in an Educational Institution as an Affiliated Student Declaration</h3>
                        <p>إقرار طلب الالتحاق بمنشأة تعليمية عن طريق الانتساب</p>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <tr>
                                <th colspan="2">
                                    Enrolling in an Educational Institution as an Affiliated Student Declaration
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <p>the undersigned; I acknowledge and pledge the following:</p>
                                    <p>1. That if approval is obtained, it is for the program (degree and specialization) and university mentioned in the application only.</p>
                                    <p>2. That the degree takes place outside working hours, and there is no conflict between working hours and degree times.</p>
                                    <p>3. That Riyadh Second Health Cluster is not responsible for any future change in my study times and that I am responsible for adhering to paragraph (2) of this declaration throughout the program period.</p>
                                    <p>4. To not request Riyadh Second Health Cluster to improve my employment status or upgrade my position or any administrative tasks after obtaining the above-mentioned academic qualification.</p>
                                    <p>5. To start work immediately after the end of the exam leave.</p>
                                    <p>6. That Riyadh Second Health Cluster is not responsible for any financial requirements for my studies or any future financial burdens or any other compensation.</p>
                                    <p>7. To adhere to the duration of study mentioned in the application.</p>
                                    <p>8. That my enrollment in the degree does not affect my performance and the requirements of my work in Riyadh Second Health Cluster.</p>
                                    <p>9. That Riyadh Second Health Cluster has the right to suspend my studies if any of the aforementioned items are violated.</p>
                                    <p>10. That by signing this declaration, I have read and understood the items in it.</p>
                                </td>
                                <td style="text-align:right; direction:rtl; width:50%">
                                    <br />
                                    <p>:أنا الموقع أدناه؛ أقر واتعهد بالآتي</p>
                                    <p>في حال الحصول على الموافقة فأنها تكون للبرنامج (الدرجة العلمية والتخصص) والجامعة المذكورة في الطلب .1</p>
                                    <p>2. تكون الدراسة خارج ساعات العمل ولا يوجد تعارض بين أوقات العمل وأوقات الدراسة.</p>
                                    <p>3. تجمع الرياض الصحي الثاني غير مسؤول عن أي تغيير مستقبلي بأوقات دراستي وأكون المسؤول عن الالتزام بالفقرة (2) من هذا الاقرار طوال فترة البرنامج.</p>
                                    <p>4. عدم مطالبة تجمع الرياض الصحي الثاني بتحسين وضعي الوظيفي أو ترقية منصبي الوظيفي أو أي أعباء إدارية بعد الحصول على المؤهل العلمي المذكور أعلاه.</p>
                                    <p>5. يتعين على مباشرة العمل بعد انتهاء إجازة الاختبارات.</p>
                                    <p>6. تجمع الرياض الصحي الثاني غير مسؤول عن أي متطلبات مالية لدراستي أو أي أعباء مالية مستقبلاً أو أي تعويض آخر.</p>
                                    <p>7. الالتزام بمدة الدراسة المذكورة في الطلب.</p>
                                    <p>8. التحاقي بالدراسة لا يؤثر على عطائي ومتطلبات عملي تجمع الرياض الصحي الثاني.</p>
                                    <p>9. يحق لتجمع الرياض الصحي الثاني إيقاف دراستي عند مخالفة أياً من البنود المذكورة أعلاه أو مخالفة السياسات المذكورة بالإقرار.</p>
                                    <p>10. أني قرأت وفهمت ماورد في هذا الإقرار وعليه أوقع.</p>
                                </td>
                            </tr>
                            <tr>
                                <td> <input type="text" class="form-control" id="EmployeeNameTextBox" /> </td>
                                <td> Employee Name اسم الموظف </td>
                            </tr>
                            <tr>
                                <td> <asp:FileUpload  type="file"  class="form-control-file" id="SignatureFile"  runat="server" /> </td>
                                <td> Signature التوقيع </td>
                            </tr>
                            <tr>
                                <td> <input type="date" class="form-control" id="DateTextBox" /> </td>
                                <td> Date التاريخ </td>
                            </tr>
                        </table>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="SubmitButton" class="btn btn-primary btn-block m-2" style="background:#38a6aa"  Text="Submit تأكيد ارسال الطلب" OnClick="SubmitButton_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </asp:Content>

