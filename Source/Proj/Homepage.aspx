<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Proj.Homepage" MaintainScrollPositionOnPostback="true"  %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<html>
    <body>
        <form runat="server" style="margin:60px">
            <asp:Label runat="server" Text="Add Project" Font-Size="Large" ></asp:Label><br /><br />
            <asp:TextBox ID="TP" runat="server" Width="130px" placeholder="project name"></asp:TextBox>
            <asp:Button ID="BtnSaveProj" runat="server" Text="Add Project" OnClick="SaveProject" /> 
            <br /><br /><br />
            <asp:Label runat="server" Text="Add Task" Font-Size="Large"></asp:Label>
            <asp:GridView ID="GrvNewTask" runat="server" Autogeneratecolumns=false EmptyDataText="No data."
            CellPadding="10" OnRowUpdating="Save" ShowHeader="false" BorderStyle="None" BorderColor="white" margin="50px">
                <Columns>
                    <asp:TemplateField  HeaderText="Task Name">
                        <ItemTemplate>
                            <asp:TextBox ID="T1" runat="server" Width="130px" placeholder="task name"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle Width="130px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Task Desc">
                        <ItemTemplate>
                            <asp:TextBox ID="T2" runat="server" Width="350px" placeholder="task description"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle Width="350px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project">
                        <ItemTemplate>
                            <asp:DropDownList ID="T3" runat="server"  Width="130px"
                             DataTextField="Name"  
                             DataValueField="ProjectID"  
                             AutoPostBack="True">
                            </asp:DropDownList>
                        </ItemTemplate>
                        <HeaderStyle Width="130px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Client">
                        <ItemTemplate>
                            <asp:TextBox ID="T4" runat="server" Width="130px" placeholder="client"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle Width="130px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Time">
                        <ItemTemplate>
                            <asp:TextBox ID="T5" runat="server" Width="200px" TextMode="DateTimeLocal" Text='<%# (DateTime.Now).ToString("yyyy-MM-ddTHH:mm") %>'></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Time">
                        <ItemTemplate>
                            <asp:TextBox ID="T6" runat="server" Width="200px" TextMode="DateTimeLocal" Text='<%# (DateTime.Now).ToString("yyyy-MM-ddTHH:mm") %>'></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="130px">
                        <ItemTemplate>
                            <asp:Button ID="BtnSave" runat="server" Text="Add Task" CommandName="Update" />  
                        </ItemTemplate>
                        <HeaderStyle Width="130px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br /><br />
            <asp:Label runat="server" Text="Tasks last week" Font-Size="Large"></asp:Label><br /><br />
            <asp:GridView ID="GrvTasks" runat="server" Autogeneratecolumns=false EmptyDataText="No data."
            CellPadding="10" OnRowCancelingEdit="Cancel" OnRowEditing="Edit" OnRowUpdating="Update" BorderStyle="None" BorderColor="white" margin="50px">
                <Columns>
                    <asp:TemplateField  HeaderText="Task Name">
                        <ItemTemplate>
                            <asp:TextBox ID="Lbl1" runat="server" ReadOnly="true" style="background:white;border:none;box-shadow:none;" Text='<%# Eval("Name") %>' Width="130px"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txb1" runat="server" Text='<%# Eval("Name") %>' Width="130px"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="130px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Task Desc">
                        <ItemTemplate>
                            <asp:TextBox ID="Lbl2" runat="server" ReadOnly="true" style="background:white;border:none;box-shadow:none;" Text='<%# Eval("Description") %>' Width="350px"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txb2" runat="server" Text='<%# Eval("Description") %>' Width="350px"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="350px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project">
                        <ItemTemplate>
                            <asp:TextBox ID="Lbl3" runat="server" ReadOnly="true" style="background:white;border:none;box-shadow:none;" Text='<%# Eval("Project") %>' Width="130px"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="Txb3" runat="server"  Width="130px"
                             DataTextField="Name"  
                             DataValueField="ProjectID"
                              >
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <HeaderStyle Width="130px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Client">
                        <ItemTemplate>
                            <asp:TextBox ID="Lbl4" runat="server" ReadOnly="true" style="background:white;border:none;box-shadow:none;" Text='<%# Eval("Client") %>' Width="130px"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txb4" runat="server" Text='<%# Eval("Client") %>' Width="130px"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="130px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Time">
                        <ItemTemplate>
                            <asp:TextBox ID="Lbl5" runat="server" ReadOnly="true" style="background:white;border:none;box-shadow:none;" Text='<%# Eval("StartTime") %>' Width="200px"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txb5" runat="server" Text='<%# Convert.ToDateTime(Eval("StartTime")).ToString("yyyy-MM-ddTHH:mm") %>' Width="200px" TextMode="DateTimeLocal"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Time">
                        <ItemTemplate>
                            <asp:TextBox ID="Lbl6" runat="server" ReadOnly="true" style="background:white;border:none;box-shadow:none;" Text='<%# Eval("EndTime") %>' Width="200px"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Txb6" runat="server" Text='<%# Convert.ToDateTime(Eval("EndTime")).ToString("yyyy-MM-ddTHH:mm") %>' Width="200px" TextMode="DateTimeLocal"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray"  />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="130px">
                        <ItemTemplate>
                            <asp:Button ID="BtnEdit" runat="server" Text="Edit" CommandName="Edit" />  
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="BtnUpdate" runat="server" Text="Update" CommandName="Update"/>  
                            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                        </EditItemTemplate>
                        <HeaderStyle Width="130px" BackColor="LightGray" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br /><br />
            <asp:Label runat="server" Text="Project Summary" Font-Size="Large"></asp:Label><br /><br />

            <asp:TextBox ID="C1" runat="server" Width="130px" TextMode="Date"></asp:TextBox>
            <asp:Button ID="BtnGenerate" runat="server" Text="Generate" OnClick="GenerateSummary"/> <br /><br />
            <asp:GridView ID="GrvSummary" runat="server" EmptyDataText="No data." AutoGenerateColumns="false"
            CellPadding="10" BorderStyle="None" BorderColor="white" margin="50px">
                <Columns>
                    <asp:TemplateField  HeaderText="project">
                        <ItemTemplate>
                            <asp:Label ID="D0" runat="server" Width="90px" Text='<%# Eval("ProjectName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Monday">
                        <ItemTemplate>
                            <asp:Label ID="D1" runat="server" Width="90px" Text='<%# Eval("Mon") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tuesday">
                        <ItemTemplate>
                            <asp:Label ID="D2" runat="server" Width="90px" Text='<%# Eval("Tue") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Wednesday">
                        <ItemTemplate>
                            <asp:Label ID="D3" runat="server" Width="90px" Text='<%# Eval("Wed") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thursday">
                        <ItemTemplate>
                            <asp:Label ID="D4" runat="server" Width="90px" Text='<%# Eval("Thu") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Friday">
                        <ItemTemplate>
                            <asp:Label ID="D5" runat="server" Width="90px" Text='<%# Eval("Fri") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Saturday">
                        <ItemTemplate>
                            <asp:Label ID="D6" runat="server" Width="90px" Text='<%# Eval("Sat") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sunday">
                        <ItemTemplate>
                            <asp:Label ID="D7" runat="server" Width="90px" Text='<%# Eval("Sun") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="false" BackColor="LightGray" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView><br /><br />
            <asp:Chart ID="chart1" runat="server" ImageStorageMode="UseImageLocation" >
                <Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <axisy>
                            <MajorGrid Enabled ="False" />
                        </axisy>
                        <axisx>
                            <MajorGrid Enabled="false"/>
                        </axisx>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </form>
    </body>
</html>