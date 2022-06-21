class test_warning {
     enum xnotification {
       var isRead: Bool = false
     }
  
     func test_warn() {
            var ynotification = [xnotification(isRead: false), xnotification(isRead: true)]

            for notification in ynotification {
                if !(notification.isRead ?? false) {
                    DispatchQueue.main.async {
                        self.unread += 1
                    }
                }
            }
     }
}
